import React from 'react';
import {DateField, FunctionField, ReferenceField, Show, SimpleShowLayout, TextField, TopToolbar} from 'react-admin';
import {DownloadButton} from "../files/DownloadButton";
import prettyBytes from "pretty-bytes";

const AttachmentActions = ({basePath, data, resource}) => (
    <TopToolbar>
        {/*<ListButton basePath={basePath} record={data}/>*/}
        {/*<EditButton basePath={basePath} record={data}/>*/}
        <DownloadButton filePath={data.path}/>
    </TopToolbar>
);

export const AttachmentShow = (props) => {
    console.info('AttachmentShow:', props);
    return (
        <Show actions={<AttachmentActions/>} {...props} >
            <SimpleShowLayout>
                <TextField label={'名称'} source="name"/>
                <TextField label={'路径'} source="path"/>
                {/*<TextField label={'大小（字节）'} source="sizes"/>*/}
                <FunctionField label={'大小（字节）'} render={record => `${prettyBytes(record.sizes)}`}/>
                {/*<TextField label={'状态编码'} source="stateId"/>*/}
                <TextField label={'备注'} source="remark"/>
                <ReferenceField reference="users" source="creatorId" link="show">
                    <TextField source="username"/>
                </ReferenceField>
                <DateField source="createdTime" showTime/>
            </SimpleShowLayout>
        </Show>
    );
};
