import React from 'react';
import {Create, maxLength, required, SimpleForm, TextInput} from 'react-admin';

export const DictionaryTypeCreate = (props) => {
    console.info('DictionaryTypeCreate:', props);
    return (
        <Create {...props}>
            <SimpleForm>
                <TextInput label={'编码'} source="code" validate={[required(), maxLength(32)]}/>
                <TextInput label={'名称'} source="name" validate={[required(), maxLength(32)]}/>
                <TextInput label={'备注'} source="remark" validate={[maxLength(255)]} fullWidth multiline/>
            </SimpleForm>
        </Create>
    );
};
