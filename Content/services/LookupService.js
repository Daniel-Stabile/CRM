import http from "./Http";

export default {
    getLookupData: function(entityName, resultFields, origem) {

        let params = "?query=";
        params += "&entityName=" + entityName;
        params += "&resultFields=" + resultFields;
        params += "&startRow=" + 0;
        params += "&maxRows=" + 0;
		
		if (origem)
			params += "&origem=" + origem;

        return http.get("api/lookup" + params);
    },

    generateSearchContext: function(targetEntity, resultFieldNameList, lookupViewName, sourceEntity, whereClauseSessionKey) {
        let params = "?targetEntity=" + targetEntity;
        params += "&resultFieldNameList=" + resultFieldNameList;
        params += "&lookupViewName=" + lookupViewName;
        params += "&sourceEntity=" + sourceEntity;
        params += "&whereClauseSessionKey=" + whereClauseSessionKey;

        return http.post("api/lookup/generateSearchContext" + params);
    },
}