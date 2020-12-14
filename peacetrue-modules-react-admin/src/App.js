// in src/App.js
import React from 'react';
import {Admin, mergeTranslations, Resource} from 'react-admin';
import polyglotI18nProvider from 'ra-i18n-polyglot';
import chineseMessages from 'ra-language-chinese';
import UserResource from './modules/users';
import {authProvider, dataProvider2 as dataProvider} from "./instances";
import customRoutes from './customRoutes';
import messages from "./messages";
import CustomLayout from "./CustomLayout";
import DictionaryValueResource from "./modules/dictionary-values";
import NoticeResource from "./modules/notices";
import ClassifyResource from "./modules/classifys";
import FileResource from "./modules/files";
import AttachmentResource from "./modules/attachments";
import DictionaryTypeResource from "./modules/dictionary-types";
import RegionResource from "./modules/regions";

const i18nProvider = polyglotI18nProvider(() => mergeTranslations(chineseMessages, messages), 'cn');

const App = () => (
    <Admin
        // dashboard={Dashboard}
        dataProvider={dataProvider}
        authProvider={authProvider}
        i18nProvider={i18nProvider}
        customRoutes={customRoutes}
        appLayout={CustomLayout}
    >
        {permissions => {
            let resources = [
                UserResource,
                FileResource,
                AttachmentResource,
                DictionaryTypeResource,
                DictionaryValueResource,
                ClassifyResource,
                RegionResource,
                NoticeResource,
            ];
            resources.push(<Resource name={'enums/noticeState'}/>);
            resources.push(<Resource name={'profile'}/>);
            return resources;
        }}
    </Admin>
);

export default App;
