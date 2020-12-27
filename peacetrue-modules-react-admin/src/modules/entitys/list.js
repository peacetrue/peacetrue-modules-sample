import React from 'react';
import {
    BooleanField,
    Datagrid,
    DateField,
    DateInput,
    EditButton,
    Filter,
    List,
    ReferenceField,
    TextField,
    TextInput
} from 'react-admin';

const Filters = (props) => (
    <Filter {...props}>
        <TextInput label={'编码'} source="code" allowEmpty alwaysOn resettable/>
        <TextInput label={'名称'} source="name" allowEmpty alwaysOn resettable/>
        <DateInput label={'创建时间起始值'} source="createdTime.lowerBound" allowEmpty/>
        <DateInput label={'创建时间结束值'} source="createdTime.upperBound" allowEmpty/>
    </Filter>
);

export const EntityList = props => {
    console.info('EntityList:', props);
    return (
        <List {...props} filters={<Filters/>}>
            <Datagrid rowClick="show">
                <TextField source="code"/>
                <TextField source="name"/>
                <BooleanField source="manyToMany"/>
                <TextField source="serialNumber"/>
                <ReferenceField reference="users" source="creatorId" link="show">
                    <TextField source="username"/>
                </ReferenceField>
                <DateField source="createdTime" showTime/>
                <EditButton/>
            </Datagrid>
        </List>
    )
};
