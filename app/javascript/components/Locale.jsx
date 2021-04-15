import React from "react"

class Locale extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            locale: ""
        };
    }

    onChangeLocaleMenu(e) {
        let locale = e.target.value;
        this.setState({locale: locale}, () => {
            document.getElementById("react-locale-submit").click();
        });
    }

    render() {
        return (
            <form action={"/locale"} method={"POST"} className={"locale"}>
                <input type={"hidden"} name={"authenticity_token"} value={this.props.info.authenticityToken}/>
                <input type={"hidden"} name={"locale"} value={this.state.locale}/>
                <h6><i className={"fas fa-globe"}/> LANGUAGE</h6>
                <select value={""} onChange={(e) => {
                    this.onChangeLocaleMenu(e)
                }}>
                    <option value={""}>SELECT LANGUAGE</option>
                    {
                        this.props.info.languages.map((language)=>{
                            return(
                                <option value={language.permalink}>
                                    {language.name}
                                </option>
                            );
                        })
                    }
                </select>
                <input type={"submit"} id={"react-locale-submit"}/>
            </form>
        );
    }
}

export default Locale
