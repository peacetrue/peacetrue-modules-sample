import * as React from "react";
import {Fragment} from "react";
import {BulkDeleteButton, SaveButton, Toolbar} from "react-admin";
import {labeledImageFieldBuilder} from "./modules/files/utils";
import messages from "./messages";

/** default to save and delete, this just save */
export const SaveToolbar = props => (
    <Toolbar {...props} >
        <SaveButton/>
    </Toolbar>
);

/** default to undoable, this to confirm */
export const ConfirmBulkActionButtons = props => (
    <Fragment>
        <BulkDeleteButton {...props} undoable={false}/>
    </Fragment>
);

export const LabeledCustomImageField = labeledImageFieldBuilder(messages.resources);

