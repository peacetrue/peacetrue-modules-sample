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

export const LogEdit = (props) => {
    console.info('LogEdit:', props);
    return (
        <Edit {...props} undoable={false}>
            <SimpleForm>
                <TextInput source="moduleCode" validate={[required(), maxLength(63)]}/>
                <NumberInput source="recordId" validate={[minValue(0)]} min={0}/>
                <TextInput source="operateCode" validate={[required(), maxLength(63)]}/>
                <TextInput source="description" validate={[required(), maxLength(255)]}/>
                <NumberInput source="duration" validate={[required(), minValue(0)]} min={0}/>
                <TextInput source="input" validate={[maxLength(2046)]}/>
                <TextInput source="output" validate={[maxLength(2046)]}/>
                <TextInput source="exception" validate={[maxLength(1022)]}/>
                <ReferenceField reference="users" source="creatorId" link={'show'}>
                    <TextField source="username"/>
                </ReferenceField>
                <DateField source="createdTime" showTime/>
            </SimpleForm>
        </Edit>
    );
};
