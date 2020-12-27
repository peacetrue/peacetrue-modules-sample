import React from 'react';
import {
    Datagrid,
    DateField,
    DateInput,
    EditButton,
    Filter,
    List,
    ReferenceField,
    ReferenceInput,
    SelectInput,
    TextField,
    TextInput
} from 'react-admin';
import referencePropsBuilder from "../dictionary-values/utils";

const Filters = (props) => (
    <Filter {...props}>
        <ReferenceInput reference="entitys" source="entityId" allowEmpty alwaysOn>
            <SelectInput source="name" resettable/>
        </ReferenceInput>
        <TextInput label={'编码'} source="code" allowEmpty alwaysOn resettable/>
        <TextInput label={'名称'} source="name" allowEmpty alwaysOn resettable/>
        <DateInput label={'创建时间起始值'} source="createdTime.lowerBound" allowEmpty/>
        <DateInput label={'创建时间结束值'} source="createdTime.upperBound" allowEmpty/>
    </Filter>
);

export const PropertyList = props => {
    console.info('PropertyList:', props);
    return (
        <List {...props} filters={<Filters/>}>
            <Datagrid rowClick="show">
                <ReferenceField reference="entitys" source="entityId" link="show">
                    <TextField source="name"/>
                </ReferenceField>
                <TextField source="code"/>
                <TextField source="name"/>
                <ReferenceField {...referencePropsBuilder('javaBasicType')} source="typeId" link="show">
                    <TextField source="name"/>
                </ReferenceField>
                <ReferenceField reference="entitys" source="referenceId" link="show">
                    <TextField source="name"/>
                </ReferenceField>
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
