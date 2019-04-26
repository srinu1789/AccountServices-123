xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$encryptPasswordRequest1" element="ns1:encryptPasswordRequest" location="../xsd/AccountCoreServices.xsd" ::)
(:: pragma bea:local-element-complex-return type="EncryptPasswordRequestType/INPUT" location="../../../TFCommon/Services/CoreCBOServices/xsd/CoreCBOServices.xsd" ::)

declare namespace ns1 = "http://www.tracfone.com/AccountCoreServices";
declare namespace ns0 = "http://www.tracfone.com/CommonTypes";
declare namespace xf = "http://tempuri.org/AccountServices/CoreServices/Transformations/EncryptPassword2CBORequest/";

declare function xf:EncryptPassword2CBORequest($encryptPasswordRequest1 as element(ns1:encryptPasswordRequest))
    as element() {
        <INPUT TASK = "encryptAccountPassword">
            <ASCIIPASSWORD>{ data($encryptPasswordRequest1/ns1:password) }</ASCIIPASSWORD>
        </INPUT>
};

declare variable $encryptPasswordRequest1 as element(ns1:encryptPasswordRequest) external;

xf:EncryptPassword2CBORequest($encryptPasswordRequest1)