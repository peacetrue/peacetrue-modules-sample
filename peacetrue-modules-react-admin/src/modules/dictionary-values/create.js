import React from 'react';
import {Create, maxLength, ReferenceInput, required, SelectInput, SimpleForm, TextInput} from 'react-admin';

export const DictionaryValueCreate = (props) => {
    console.info('DictionaryValueCreate:', props);
    return (
        <Create {...props}>
            <SimpleForm>
                <ReferenceInput label={'字典类型'} reference="dictionary-types" source="dictionaryTypeId" link="show">
                    <SelectInput source="name"/>
                </ReferenceInput>
                <TextInput label={'编码'} source="code" validate={[required(), maxLength(32)]}/>
                <TextInput label={'名称'} source="name" validate={[required(), maxLength(255)]}/>
                <TextInput label={'名称'} source="name" validate={[required(), maxLength(255)]}/>
                <TextInput label={'备注'} source="remark" validate={[maxLength(255)]} fullWidth multiline/>
            </SimpleForm>
        </Create>
    );
};
