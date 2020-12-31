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
import {useListStyles} from "../../Styles";

const Filters = (props) => (
    <Filter {...props}>
        <TextInput label={'模块编码'} source="moduleCode" allowEmpty alwaysOn resettable/>
        <TextInput label={'操作编码'} source="operateCode" allowEmpty alwaysOn resettable/>
        <DateInput label={'创建时间起始值'} source="createdTime.lowerBound" allowEmpty alwaysOn/>
        <DateInput label={'创建时间结束值'} source="createdTime.upperBound" allowEmpty alwaysOn/>
    </Filter>
);


export const LogList = props => {
    console.info('LogList:', props);
    let classes = useListStyles();
    return (
        <List {...props} filters={<Filters/>}>
            <Datagrid rowClick="show">
                <TextField source="moduleCode"/>
                <TextField source="recordId"/>
                <TextField source="operateCode"/>
                <TextField source="description" cellClassName={classes.width5}/>
                <TextField source="duration"/>
                {/*<TextField source="input" cellClassName={classes.width5}/>*/}
                {/*<TextField source="output" cellClassName={classes.width5}/>*/}
                <TextField source="exception" cellClassName={classes.width5}/>
                <ReferenceField reference="users" source="creatorId" link={'show'}>
                    <TextField source="username"/>
                </ReferenceField>
                <DateField source="createdTime" showTime/>
            </Datagrid>
        </List>
    )
};
