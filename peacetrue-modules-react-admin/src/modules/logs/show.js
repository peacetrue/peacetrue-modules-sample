import React from 'react';
import {Datagrid, DateField, FunctionField, ReferenceField, Show, SimpleShowLayout, TextField} from 'react-admin';
import {JsonField} from "react-admin-json-view";

export const LogShow = (props) => {
    console.info('LogShow:', props);
    return (
        <Show {...props}>
            <SimpleShowLayout>
                <TextField source="moduleCode"/>
                <TextField source="recordId"/>
                <TextField source="operateCode"/>
                <TextField source="description"/>
                <TextField source="duration"/>
                <FunctionField source={'input'} render={record =>
                    (<JsonField
                        record={{...record, input: JSON.parse(record.input)}}
                        source="input"
                        addLabel={true}
                        reactJsonOptions={{
                            // Props passed to react-json-view
                            name: null,
                            collapsed: 2,
                            enableClipboard: false,
                            displayDataTypes: false,
                        }}
                    />)}/>
                <FunctionField source={'output'} render={record =>
                    (<JsonField
                        record={{...record, output: JSON.parse(record.output)}}
                        source="output"
                        addLabel={true}
                        reactJsonOptions={{
                            // Props passed to react-json-view
                            name: null,
                            collapsed: 2,
                            enableClipboard: false,
                            displayDataTypes: false,
                        }}
                    />)}/>
                <TextField source="exception"/>
                <ReferenceField reference="users" source="creatorId" link={'show'}>
                    <TextField source="username"/>
                </ReferenceField>
                <DateField source="createdTime" showTime/>
            </SimpleShowLayout>
        </Show>
    );
};
