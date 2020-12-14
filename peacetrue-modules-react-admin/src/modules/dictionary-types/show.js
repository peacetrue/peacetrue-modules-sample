import React from 'react';
import {DateField, ReferenceField, Show, SimpleShowLayout, TextField} from 'react-admin';

export const DictionaryTypeShow = (props) => {
    console.info('DictionaryTypeShow:', props);
    return (
        <Show {...props}>
            <SimpleShowLayout>
                <TextField label={'编码'} source="code"/>
                <TextField label={'名称'} source="name"/>
                <TextField label={'备注'} source="remark"/>
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
