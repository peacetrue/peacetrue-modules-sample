import React from 'react';
import {BooleanInput, Create, maxLength, minValue, NumberInput, required, SimpleForm, TextInput} from 'react-admin';

export const EntityCreate = (props) => {
    console.info('EntityCreate:', props);
    return (
        <Create {...props}>
            <SimpleForm>
                <TextInput source="code" validate={[required(), maxLength(64)]} resettable/>
                <TextInput source="name" validate={[required(), maxLength(255)]} resettable/>
                <BooleanInput source="manyToMany"/>
                <TextInput source="remark" validate={[maxLength(255)]} fullWidth resettable/>
                <NumberInput source="serialNumber" validate={[minValue(0)]} min={0} resettable/>
            </SimpleForm>
        </Create>
    );
};
