import React from 'react';
import {
    BooleanField,
    Button,
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
    TextInput,
    useListContext
} from 'react-admin';
import ExpandMoreSharpIcon from '@material-ui/icons/ExpandMoreSharp';
import {ConfirmBulkActionButtons} from "../../Components";
import exporterBuilder from "../../exporter";

const Filters = (props) => (
    <Filter {...props}>
        <ReferenceInput source="parentId" reference="regions" allowEmpty alwaysOn>
            <SelectInput source="name" resettable/>
        </ReferenceInput>
        <TextInput label={'编码'} source="code" allowEmpty alwaysOn resettable/>
        <TextInput label={'名称'} source="name" allowEmpty alwaysOn resettable/>
        <DateInput label={'创建时间起始值'} source="createdTime.lowerBound" allowEmpty/>
        <DateInput label={'创建时间结束值'} source="createdTime.upperBound" allowEmpty/>
    </Filter>
);

const ChildrenButton = ({record}) => {
    const {
        filterValues,
        setFilters,
    } = useListContext();
    return record.leaf ? null : (
        <Button label={'下级'} onClick={e => {
            e.stopPropagation();
            setFilters({...filterValues, parentId: record.id})
        }}>
            <ExpandMoreSharpIcon/>
        </Button>
    );
}

export const RegionList = props => {
    console.info('RegionList:', props);
    return (
        <List {...props}
              filters={<Filters/>}
              bulkActionButtons={<ConfirmBulkActionButtons/>}
              exporter={exporterBuilder(props.resource)}
        >
            <Datagrid rowClick="show">
                <ReferenceField source="parentId" reference="regions">
                    <TextField source="name"/>
                </ReferenceField>
                <TextField label={'编码'} source="code"/>
                <TextField label={'名称'} source="name"/>
                <TextField label={'层级'} source="level"/>
                <BooleanField source="leaf"/>
                <TextField source="serialNumber"/>
                <ReferenceField reference="users" source="creatorId" link="show">
                    <TextField source="username"/>
                </ReferenceField>
                <DateField source="createdTime" showTime/>
                <ChildrenButton/>
                <EditButton/>
            </Datagrid>
        </List>
    )
};
