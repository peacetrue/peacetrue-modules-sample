import React from 'react';
import {BooleanField, DateField, NumberField, ReferenceField, Show, SimpleShowLayout, TextField} from 'react-admin';

export const EntityShow = (props) => {
    console.info('EntityShow:', props);
    return (
        <Show {...props}>
            <SimpleShowLayout>
                <TextField source="code"/>
                <TextField source="name"/>
                <BooleanField source="manyToMany"/>
                <TextField source="remark"/>
                <NumberField source="serialNumber"/>
                <ReferenceField reference="users" source="creatorId" link="show">
                    <TextField source="username"/>
                </ReferenceField>
                <DateField source="createdTime" showTime/>
                <ReferenceField reference="users" source="modifierId" link="show">
                    <TextField source="username"/>
                </ReferenceField>
                <DateField source="modifiedTime" showTime/>
            </SimpleShowLayout>
        </Show>
    );
};
