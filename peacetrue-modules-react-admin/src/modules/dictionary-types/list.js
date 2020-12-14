import React from 'react';
import {
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
import exporterBuilder from "../../exporter";
import {ConfirmBulkActionButtons} from "../../Components";

const Filters = (props) => (
    <Filter {...props}>
        <TextInput source="code" allowEmpty alwaysOn resettable/>
        <TextInput source="name" allowEmpty alwaysOn resettable/>
        <DateInput label={'创建时间起始值'} source="createdTime.lowerBound" allowEmpty/>
        <DateInput label={'创建时间结束值'} source="createdTime.upperBound" allowEmpty/>
    </Filter>
);

export const DictionaryTypeList = props => {
    console.info('DictionaryTypeList:', props);
    return (
        <List {...props}
              filters={<Filters/>}
              bulkActionButtons={<ConfirmBulkActionButtons/>}
              exporter={exporterBuilder(props.resource)}
        >
            <Datagrid rowClick="show">
                <TextField source="code"/>
                <TextField source="name"/>
                <TextField source="remark"/>
                <ReferenceField reference="users" source="creatorId" link="show">
                    <TextField source="username"/>
                </ReferenceField>
                <DateField source="createdTime" showTime/>
                <EditButton/>
            </Datagrid>
        </List>
    )
};
