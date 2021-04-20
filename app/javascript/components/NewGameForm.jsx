import React from "react"

class NewGameForm extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            engineCode: "no_content"
        };
    }

    onChangeEngineCode(e) {
        let value = e.target.value;
        this.setState({engineCode: value});
    }

    render() {
        let webGameFields;

        switch (this.state.engineCode) {
            case "no_content":
                webGameFields = (
                    <div>
                        {this.props.info.locale.noContent.description}
                    </div>
                );
                break;
            case "unity_2019_4_x":
                webGameFields = (
                    <div>
                        <div>
                            <div className={"field"}>
                                <h4>{this.props.info.locale.displaySize}</h4>
                                <div className={"field-container"}>
                                    <div className={"field-content"}>
                                        <h5>{this.props.info.locale.width}</h5>
                                        <input type={"number"} name={"game[unity201904_game_attributes][width]"} defaultValue={960}/>
                                    </div>
                                    <div className={"field-multiply"}>
                                        x
                                    </div>
                                    <div className={"field-content"}>
                                        <h5>{this.props.info.locale.height}</h5>
                                        <input type={"number"} name={"game[unity201904_game_attributes][height]"} defaultValue={540}/>
                                    </div>
                                </div>
                            </div>
                            <div className={"field"}>
                                <h4>{this.props.info.locale.unity20194x.loaderFile}</h4>
                                <input type={"file"} name={"game[unity201904_game_attributes][loader_file]"}/>
                            </div>
                            <div className={"field"}>
                                <h4>{this.props.info.locale.unity20194x.dataFile}</h4>
                                <input type={"file"} name={"game[unity201904_game_attributes][data_file]"}/>
                            </div>
                            <div className={"field"}>
                                <h4>{this.props.info.locale.unity20194x.codeFile}</h4>
                                <input type={"file"} name={"game[unity201904_game_attributes][code_file]"}/>
                            </div>
                            <div className={"field"}>
                                <h4>{this.props.info.locale.unity20194x.frameworkFile}</h4>
                                <input type={"file"} name={"game[unity201904_game_attributes][framework_file]"}/>
                            </div>
                            <div className={"field"}>
                                <h4>{this.props.info.locale.unity20194x.jsonFile}</h4>
                                <input type={"file"} name={"game[unity201904_game_attributes][json_file]"}/>
                            </div>
                            <div className={"field"}>
                                <input type={"checkbox"}
                                       name={"game[unity201904_game_attributes][is_allowed_fullscreen]"}/> {this.props.info.locale.allowedFullscreen}
                            </div>
                        </div>
                    </div>
                );
                break;
            case "unity_2020_3_x":
                webGameFields = (
                    <div>
                        <div className={"description"}>
                            {this.props.info.locale.unity20203x.description}
                        </div>
                        <div className={"field"}>
                            <h4>{this.props.info.locale.displaySize}</h4>
                            <div className={"field-container"}>
                                <div className={"field-content"}>
                                    <h5>{this.props.info.locale.width}</h5>
                                    <input type={"number"} name={"game[unity202003_game_attributes][width]"} defaultValue={960}/>
                                </div>
                                <div className={"field-multiply"}>
                                    x
                                </div>
                                <div className={"field-content"}>
                                    <h5>{this.props.info.locale.height}</h5>
                                    <input type={"number"} name={"game[unity202003_game_attributes][height]"} defaultValue={540}/>
                                </div>
                            </div>
                        </div>
                        <div className={"field"}>
                            <h4>{this.props.info.locale.unity20203x.loaderFile}</h4>
                            <input type={"file"} name={"game[unity202003_game_attributes][loader_file]"}/>
                        </div>
                        <div className={"field"}>
                            <h4>{this.props.info.locale.unity20203x.dataFile}</h4>
                            <input type={"file"} name={"game[unity202003_game_attributes][data_file]"}/>
                        </div>
                        <div className={"field"}>
                            <h4>{this.props.info.locale.unity20203x.frameworkFile}</h4>
                            <input type={"file"} name={"game[unity202003_game_attributes][framework_file]"}/>
                        </div>
                        <div className={"field"}>
                            <h4>{this.props.info.locale.unity20203x.wasmFile}</h4>
                            <input type={"file"} name={"game[unity202003_game_attributes][wasm_file]"}/>
                        </div>
                        <div className={"field"}>
                            <input type={"checkbox"} name={"game[unity202003_game_attributes][is_allowed_fullscreen]"}/> {this.props.info.locale.allowedFullscreen}
                        </div>
                    </div>
                );
                break;
        }
        return (
            <form action={"/games"} method={"POST"} className={"new-game-form"} encType={"multipart/form-data"}>
                <input type={"hidden"} name={"authenticity_token"} value={this.props.info.authenticityToken}/>
                <input type={"hidden"} name={"game[user_id]"} value={this.props.info.user.id}/>
                <div className={"field"}>
                    <h4>{this.props.info.locale.gameId}<small>{this.props.info.locale.gameIdNotice}</small></h4>
                    <input type={"text"} name={"game[permalink]"}/>
                </div>
                <div className={"field"}>
                    <h4>{this.props.info.locale.defaultLanguage}</h4>
                    <ul>
                        {
                            this.props.info.languages.map((language) => {
                                return (
                                    <li>
                                        <input type={"radio"} name={"game[default_language_id]"} value={language.id}
                                               defaultChecked={this.props.info.defaultLanguageId === language.id}/> {language.name}
                                    </li>
                                );
                            })
                        }
                    </ul>
                </div>
                <div className={"field"}>
                    <h4>{this.props.info.locale.gameEngine}</h4>
                    <ul>
                        <li>
                            <input type={"radio"} name={"game[engine_code]"} value={"no_content"}
                                   defaultChecked={true}
                                   onChange={(e) => {
                                       this.onChangeEngineCode(e)
                                   }}/> {this.props.info.locale.noContent.name}
                        </li>
                        <li>
                            <input type={"radio"} name={"game[engine_code]"} value={"unity_2020_3_x"} onChange={(e) => {
                                this.onChangeEngineCode(e)
                            }}/> {this.props.info.locale.unity20203x.name}
                        </li>
                        <li>
                            <input type={"radio"} name={"game[engine_code]"} value={"unity_2019_4_x"} onChange={(e) => {
                                this.onChangeEngineCode(e)
                            }}/> {this.props.info.locale.unity20194x.name}
                        </li>
                    </ul>
                </div>
                {webGameFields}
                <div className={"actions"}>
                    <input type={"submit"} value={this.props.info.locale.submit}/>
                </div>
            </form>
        );
    }
}

export default NewGameForm
