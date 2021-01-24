import React from 'react';
import {DateField, Edit, PasswordInput, ReferenceField, SimpleForm, TextField} from 'react-admin';
import roleField from "./role";
import userRules from "./rules";

export const UserEdit = (props) => {
    console.info('UserEdit:', props);
    return (
        <Edit  {...props} undoable={false} redirect={'view'}>
            <SimpleForm>
                <TextField source="username"/>
                <PasswordInput source="password" validate={userRules.password}/>
                {roleField}
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
