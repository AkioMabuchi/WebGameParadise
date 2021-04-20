class GamesController < ApplicationController
  def index
  end

  def show
    @game = Game.friendly.find(params[:id])
  end

  def new
    default_language = Language.find_by(permalink: t("html"))
    @react_info = {
      authenticityToken: form_authenticity_token,
      locale: {
        gameId: t("games.upload.game_id"),
        gameIdNotice: t("games.upload.game_id_notice"),
        defaultLanguage: t("games.upload.default_language"),
        gameEngine: t("games.upload.game_engine"),
        displaySize: t("games.upload.display_size"),
        width: t("games.upload.width"),
        height: t("games.upload.height"),
        allowedFullscreen: t("games.upload.allowed_fullscreen"),
        noContent:{
          name: t("games.upload.no_content.name"),
          description: t("games.upload.no_content.description")
        },
        unity20194x:{
          name: t("games.upload.unity_2019_4_x.name"),
          loaderFile: t("games.upload.unity_2019_4_x.loader_file"),
          dataFile: t("games.upload.unity_2019_4_x.data_file"),
          codeFile: t("games.upload.unity_2019_4_x.code_file"),
          frameworkFile: t("games.upload.unity_2019_4_x.framework_file"),
          jsonFile: t("games.upload.unity_2019_4_x.json_file")
        },
        unity20203x:{
          name: t("games.upload.unity_2020_3_x.name"),
          description: t("games.upload.unity_2020_3_x.description"),
          loaderFile: t("games.upload.unity_2020_3_x.loader_file"),
          dataFile: t("games.upload.unity_2020_3_x.data_file"),
          frameworkFile: t("games.upload.unity_2020_3_x.framework_file"),
          wasmFile: t("games.upload.unity_2020_3_x.wasm_file")
        },
        submit: t("games.upload.submit")
      },
      user: {
        id: current_user.id
      },
      languages: Language.order(name: :asc).select(:id, :name),
      defaultLanguageId: default_language.id
    }
  end

  def edit
  end

  def create
    game = Game.new(game_params)
    if game.save
      redirect_to root_path, notice: "ゲームを投稿しました"
    else
      redirect_to new_game_path
    end
  end

  def update

  end

  def destroy

  end

  private

  def game_params
    params.require(:game).permit(
      :user_id, :permalink, :engine_code, :default_language_id,
      unity201904_game_attributes: [:width, :height, :is_allowed_fullscreen, :loader_file, :data_file, :code_file, :framework_file, :json_file],
      unity202003_game_attributes: [:width, :height, :is_allowed_fullscreen, :loader_file, :data_file, :framework_file, :wasm_file]
    )
  end
end
