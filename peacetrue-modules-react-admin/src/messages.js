import regionMessages from "./modules/regions/messages";
import noticeMessages from "./modules/notices/messages";
import userMessages from "./modules/users/messages";
import classifyMessages from "./modules/classifys/messages";
import fileMessages from "./modules/files/messages";
import attachmentMessages from "./modules/attachments/messages";
import dictionaryTypeMessages from "./modules/dictionary-types/messages";
import dictionaryValueMessages from "./modules/dictionary-values/messages";
import entityMessages from "./modules/entitys/messages";
import propertyMessages from "./modules/propertys/messages";

export default {
    resources: {
        ...userMessages.resources,
        ...entityMessages.resources,
        ...propertyMessages.resources,
        ...noticeMessages.resources,
        ...dictionaryTypeMessages.resources,
        ...dictionaryValueMessages.resources,
        ...classifyMessages.resources,
        ...regionMessages.resources,
        ...fileMessages.resources,
        ...attachmentMessages.resources,
    },
    Forbidden: "没有操作权限"
}
