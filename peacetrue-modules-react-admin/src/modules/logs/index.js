import React from "react";
import {Resource} from "react-admin";

import {LogList} from './list';
import {LogShow} from './show';

export const Log = {list: LogList, show: LogShow};
const LogResource = <Resource name="logs" {...Log} />;
export default LogResource;
