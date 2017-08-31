export const extensions = {
	  	EXT_COMPATIBILITY       : 1 << 0,    //!< Markdown compatibility mode
		EXT_COMPLETE            : 1 << 1,    //!< Create complete document
		EXT_SNIPPET             : 1 << 2,    //!< Create snippet only
		EXT_SMART               : 1 << 3,    //!< Enable Smart quotes
		EXT_NOTES               : 1 << 4,    //!< Enable Footnotes
		EXT_NO_LABELS           : 1 << 5,    //!< Don't add anchors to headers, etc.
		EXT_PROCESS_HTML        : 1 << 6,    //!< Process Markdown inside HTML
		EXT_NO_METADATA         : 1 << 7,    //!< Don't parse Metadata
		EXT_OBFUSCATE           : 1 << 8,    //!< Mask email addresses
		EXT_CRITIC              : 1 << 9,    //!< Critic Markup Support
		EXT_CRITIC_ACCEPT       : 1 << 10,   //!< Accept all proposed changes
		EXT_CRITIC_REJECT       : 1 << 11,   //!< Reject all proposed changes
		EXT_RANDOM_FOOT         : 1 << 12,   //!< Use random numbers for footnote links
		EXT_TRANSCLUDE          : 1 << 13,   //!< Perform transclusion(s)
		EXT_FAKE                : 1 << 31    //!< 31 is highest number allowed
  };
 
export const languages = {
		ENGLISH : 0,
		DUTCH:1,
		FRENCH:2,
		GERMAN:3,
		GERMANGUILL:4,
		SWEDISH:5
  }

var MultiMarkdown = {
  renderFunction: Module.cwrap('mmd_string_convert', 'string', ['string','number','number','number']),
  languages: languages,
  extensions: extensions,
  options: {
	language: 0,
	extensions: 0
  },
  setLanguage: function(language){
	  this.options.language = language;
  },
  setExtensions: function(ext){
	this.options.extensions = ext;
  },
  render: function(string){
    return this.renderFunction(string, this.options.extensions,0,this.options.language);
  },
};
MultiMarkdown.setExtensions(extensions.EXT_SNIPPET);
export default MultiMarkdown;
