import React from 'react';
import {DateField, ReferenceField, Show, SimpleShowLayout, TextField} from 'react-admin';
import Role from "./role";

export const UserShow = (props) => {
    console.info('UserShow:', props);
    return (
        <Show {...props} >
            <SimpleShowLayout>
                <TextField source="username"/>
                {Role}
                <ReferenceField reference="users" source="creatorId" link={'show'}>
                    <TextField source="username"/>
                </ReferenceField>
                <DateField source="createdTime" showTime/>
                <ReferenceField reference="users" source="modifierId" link={'show'}>
                    <TextField source="username"/>
                </ReferenceField>
                <DateField source="modifiedTime" showTime/>
            </SimpleShowLayout>
        </Show>
    );
};
