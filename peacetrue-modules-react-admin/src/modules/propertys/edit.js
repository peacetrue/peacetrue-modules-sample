import React from 'react';
import {
    DateField,
    Edit,
    maxLength,
    minValue,
    NumberInput,
    ReferenceField,
    ReferenceInput,
    required,
    SelectInput,
    SimpleForm,
    TextField,
    TextInput
} from 'react-admin';
import referencePropsBuilder from "../dictionary-values/utils";

export const PropertyEdit = (props) => {
    console.info('PropertyEdit:', props);
    return (
        <Edit {...props} undoable={false}>
            <SimpleForm>
                <ReferenceInput reference="entitys" source="entityId" link="show">
                    <SelectInput source="name" validate={[required()]} resettable/>
                </ReferenceInput>
                <TextInput source="code" validate={[required(), maxLength(32)]} resettable/>
                <TextInput source="name" validate={[required(), maxLength(255)]} resettable/>
                <ReferenceInput {...referencePropsBuilder('javaBasicType')} source="typeId" link="show">
                    <SelectInput source="name" validate={[required()]} resettable/>
                </ReferenceInput>
                <ReferenceInput reference="entitys" source="referenceId" link="show">
                    <SelectInput source="name" resettable/>
                </ReferenceInput>
                <TextInput source="remark" validate={[maxLength(255)]} fullWidth/>
                <NumberInput source="serialNumber" validate={[required(), minValue(0)]} min={0}/>
                <ReferenceField reference="users" source="creatorId" link="show">
                    <TextField source="username"/>
                </ReferenceField>
                <DateField source="createdTime" showTime/>
                <ReferenceField reference="users" source="modifierId" link="show">
                    <TextField source="username"/>
                </ReferenceField>
                <DateField source="modifiedTime" showTime/>
            </SimpleForm>
        </Edit>
    );
};
