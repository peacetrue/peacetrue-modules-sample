import React from 'react';
import {Create, PasswordInput, SimpleForm, TextInput,} from 'react-admin';
import rules from "./rules";

export const UserCreate = (props) => {
    console.info('UserCreate:', props);
    return (
        <Create {...props}>
            <SimpleForm>
                <TextInput source="username" validate={rules.username}/>
                <PasswordInput source="password" validate={rules.password}/>
            </SimpleForm>
        </Create>
    );
};
