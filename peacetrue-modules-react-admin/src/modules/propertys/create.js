import React from 'react';
import {
    Create,
    maxLength,
    minValue,
    NumberInput,
    ReferenceInput,
    required,
    SelectInput,
    SimpleForm,
    TextInput
} from 'react-admin';
import referencePropsBuilder from "../dictionary-values/utils";

export const PropertyCreate = (props) => {
    console.info('PropertyCreate:', props);
    return (
        <Create {...props}>
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
                <NumberInput source="serialNumber" validate={[minValue(0)]} min={0}/>
            </SimpleForm>
        </Create>
    );
};
