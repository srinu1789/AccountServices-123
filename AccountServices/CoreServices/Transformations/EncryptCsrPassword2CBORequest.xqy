xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$encryptCsrPasswordRequest1" element="ns1:encryptCsrPasswordRequest" location="../xsd/AccountCoreServices.xsd" ::)
(:: pragma bea:local-element-complex-return type="EncryptCsrPasswordRequestType/INPUT" location="../../../TFCommon/Services/CoreCBOServices/xsd/CoreCBOServices.xsd" ::)

declare namespace ns1 = "http://www.tracfone.com/AccountCoreServices";
declare namespace ns0 = "http://www.tracfone.com/CommonTypes";
declare namespace xf = "http://tempuri.org/AccountServices/CoreServices/Transformations/EncryptCsrPassword2CBORequest/";

declare function xf:EncryptCsrPassword2CBORequest($encryptCsrPasswordRequest1 as element(ns1:encryptCsrPasswordRequest))
    as element() {
        <INPUT TASK = "encryptAndEncodeTextWithSecureHash">
            <PLAIN_TEXT>{ data($encryptCsrPasswordRequest1/ns1:password) }</PLAIN_TEXT>
        </INPUT>
};

declare variable $encryptCsrPasswordRequest1 as element(ns1:encryptCsrPasswordRequest) external;

xf:EncryptCsrPassword2CBORequest($encryptCsrPasswordRequest1)