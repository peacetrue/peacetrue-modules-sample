import {maxLength, minLength, regex, required} from "react-admin";

export const passwordLooseRule = [required(), maxLength(32), regex(/^[0-9a-zA-Z-.]+$/)];
export const passwordRule = [required(), minLength(6), maxLength(32), regex(/^[0-9a-zA-Z-.]+$/)];
export const userRules = {
    username: passwordRule,
    password: passwordRule,
    passwordLoose: passwordLooseRule
}

export default userRules;
