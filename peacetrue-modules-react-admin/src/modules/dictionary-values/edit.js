import React from 'react';
import {
    DateField,
    Edit,
    maxLength,
    NumberInput,
    ReferenceField,
    required,
    SimpleForm,
    TextField,
    TextInput
} from 'react-admin';

export const DictionaryValueEdit = (props) => {
    console.info('DictionaryValueEdit:', props);
    return (
        <Edit {...props}>
            <SimpleForm>
                <ReferenceField label={'字典类型'} reference="dictionary-types" source="dictionaryTypeId" link="show">
                    <TextField source="name"/>
                </ReferenceField>
                <TextField label={'编码'} source="code" validate={[required(), maxLength(32)]}/>
                <TextInput label={'名称'} source="name" validate={[required(), maxLength(32)]}/>
                <NumberInput label={'序号'} source="serialNumber" validate={[required()]}/>
                <TextInput label={'备注'} source="remark" validate={[maxLength(255)]} fullWidth multiline/>
                <ReferenceField reference="users" source="creatorId" link={'show'}>
                    <TextField source="username"/>
                </ReferenceField>
                <DateField source="createdTime" showTime/>
            </SimpleForm>
        </Edit>
    );
};
