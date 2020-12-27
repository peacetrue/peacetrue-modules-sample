import React from 'react';
import {
    BooleanInput,
    Datagrid,
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

export const EntityEdit = (props) => {
    console.info('EntityEdit:', props);
    return (
        <Edit {...props} undoable={false}>
            <SimpleForm>
                <TextInput source="code" validate={[required(), maxLength(64)]}/>
                <TextInput source="name" validate={[required(), maxLength(255)]}/>
                <BooleanInput source="manyToMany"/>
                <TextInput source="remark" validate={[maxLength(255)]} fullWidth resettable/>
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
