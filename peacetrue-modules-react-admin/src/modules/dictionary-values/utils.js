import React from "react";

export const referencePropsBuilder = (dictionaryTypeCode) => ({
    reference: "dictionary-values",
    filter: {dictionaryTypeCode: dictionaryTypeCode},
    perPage: 200,
    sort: {field: 'serialNumber', order: 'ASC'}
});

export default referencePropsBuilder;
