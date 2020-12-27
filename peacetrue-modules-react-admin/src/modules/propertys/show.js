import React from 'react';
import {Datagrid, DateField, NumberField, ReferenceField, Show, SimpleShowLayout, TextField} from 'react-admin';
import referencePropsBuilder from "../dictionary-values/utils";

export const PropertyShow = (props) => {
    console.info('PropertyShow:', props);
    return (
        <Show {...props}>
            <SimpleShowLayout>
                <TextField source="entityId"/>
                <TextField source="code"/>
                <TextField source="name"/>
                <ReferenceField {...referencePropsBuilder('javaBasicType')} source="typeId" link="show">
                    <TextField source="name"/>
                </ReferenceField>
                <ReferenceField reference="entitys" source="referenceId" link="show">
                    <TextField source="name"/>
                </ReferenceField>
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
