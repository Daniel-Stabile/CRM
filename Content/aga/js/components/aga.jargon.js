/* global AGA */
AGA.Jargon = (function () {
    var singleQuoteReplacement = "&sng_quote;";

    var hasJargonsAvailable = function () {
       if(window.AGAJargonItems) return true;
        return false;
    };

    var getTranslation = function (source) {
        var target = source.replace("'", singleQuoteReplacement);
        if (window.AGAJargonItems.hasOwnProperty(target)) {
            var value = window.AGAJargonItems[target];
            if(value) 
                value = value.replace(singleQuoteReplacement, "'");
            return value;
        }
            
        return source;
    };
    
    var internalTranslate = function (source) {
        if (!source) return source;
        if (typeof source !== "string") return source;
        if(!hasJargonsAvailable()) return source;

        return  getTranslation(source);
    };

    return {
        translate: internalTranslate
    };

})();
