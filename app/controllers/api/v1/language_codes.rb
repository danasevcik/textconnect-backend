if !!(params[:user][:language] = "en")
  return voice = {
    language_code: "en-US",
    ssml_gender:   "NEUTRAL"
  } else if !!(params[:user][:language] = "da")
  return voice = {
    language_code: "da-DK",
    ssml_gender:   "FEMALE"
  } else if !!(params[:user][:language] = "nl")
  return voice = {
    language_code: "nl-NL",
    ssml_gender:   "FEMALE"
  } else if !!(params[:user][:language] = "fr")
  return voice = {
    language_code: "fr-FR",
    ssml_gender:   "FEMALE"
  } else if !!(params[:user][:language] = "de")
  return voice = {
    language_code: "de-DE",
    ssml_gender:   "FEMALE"
  } else if !!(params[:user][:language] = "it")
  return voice = {
    language_code: "it-IT",
    ssml_gender:   "FEMALE"
  } else if !!(params[:user][:language] = "ja")
  return voice = {
    language_code: "ja-JP",
    ssml_gender:   "FEMALE"
  } else if !!(params[:user][:language] = "ko")
  return voice = {
    language_code: "ko-KR",
    ssml_gender:   "FEMALE"
  } else if !!(params[:user][:language] = "pl")
  return voice = {
    language_code: "pl-PL",
    ssml_gender:   "FEMALE"
  } else if !!(params[:user][:language] = "pt")
  return voice = {
    language_code: "pt-PT",
    ssml_gender:   "FEMALE"
  } else if !!(params[:user][:language] = "ru")
  return voice = {
    language_code: "ru-RU",
    ssml_gender:   "FEMALE"
  } else if !!(params[:user][:language] = "sk")
  return voice = {
    language_code: "sk-SK",
    ssml_gender:   "FEMALE"
  } else if !!(params[:user][:language] = "es")
  return voice = {
    language_code: "es-ES",
    ssml_gender:   "FEMALE"
  } else if !!(params[:user][:language] = "sv")
  return voice = {
    language_code: "sv-SE",
    ssml_gender:   "FEMALE"
  } else if !!(params[:user][:language] = "tr")
  return voice = {
    language_code: "tr-TR",
    ssml_gender:   "FEMALE"
  } else if !!(params[:user][:language] = "uk")
  return voice = {
    language_code: "uk-UK",
    ssml_gender:   "FEMALE"
  } else
  return voice = {
    language_code: "en-US",
    ssml_gender:   "NEUTRAL"
  }
end
