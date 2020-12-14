import React from 'react';
import {
    DateField,
    Edit,
    maxLength,
    minValue,
    NumberInput,
    ReferenceField,
    required,
    SimpleForm,
    TextField,
    TextInput
} from 'react-admin';

export const DictionaryTypeEdit = (props) => {
    console.info('DictionaryTypeEdit:', props);
    return (
        <Edit {...props}>
            <SimpleForm>
                <TextField label={'编码'} source="code"/>
                <TextInput label={'名称'} source="name" validate={[required(), maxLength(32)]}/>
                <TextInput label={'备注'} source="remark" validate={[maxLength(255)]} fullWidth multiline/>
                <NumberInput source="serialNumber" validate={[required(), minValue(0)]} min={0}/>
                <ReferenceField reference="users" source="creatorId" link="show">
                    <TextField source="username"/>
                </ReferenceField>
                <DateField source="createdTime" showTime/>
            </SimpleForm>
        </Edit>
    );
};
