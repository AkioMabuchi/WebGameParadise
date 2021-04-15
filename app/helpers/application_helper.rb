module ApplicationHelper
  def default_meta_tags
    {
      site: "Web Game Paradise",
      title: "",
      reverse: true,
      charset: "utf-8",
      description: "",
      keywords: %w[WebGameParadise WGP WebGame ブラウザゲーム Unity],
      canonical: request.original_url,
      separator: "|",
      icon:[
        {
          href: image_url("favicon.ico")
        },
        {
          href: image_url("Icon.png"),
          rel: "apple-touch-icon",
          sizes: "180x180",
          type: "image/png"
        }
      ],
      og:{
        site_name: "Web Game Paradise",
        title: "",
        description: "",
        type: "website",
        url: request.original_url,
        image: image_url("Icon.png"),
        locale: "ja-JP"
      },
      twitter:{
        card: "summary",
        site: "@AkioMabuchi"
      },
      viewport: "width=device-width, initial-scale=0.9",
    }
  end
end
