xquery version "2004-draft";
(:: pragma bea:local-element-complex-parameter parameter="$encryptAccountPassword1" type="EncryptPasswordResponseType/encryptAccountPassword" location="../../../TFCommon/Services/CoreCBOServices/xsd/CoreCBOServices.xsd" ::)
(:: pragma bea:global-element-return element="ns2:encryptPasswordResponse" location="../xsd/AccountCoreServices.xsd" ::)

declare namespace ns2 = "http://www.tracfone.com/AccountCoreServices";
declare namespace ns1 = "http://www.tracfone.com/RuntimeFault";
declare namespace ns0 = "http://www.tracfone.com/CommonTypes";
declare namespace xf = "http://tempuri.org/AccountServices/CoreServices/Transformations/CBO2EncryptPasswordResponse/";

declare function xf:CBO2EncryptPasswordResponse($encryptAccountPassword1 as element())
    as element(ns2:encryptPasswordResponse) {
        <ns2:encryptPasswordResponse>
            <ns0:result>
                <ns0:code>{ data($encryptAccountPassword1/ERROR_NUM) }</ns0:code>
                <ns0:message>{ data($encryptAccountPassword1/ERROR_STRING) }</ns0:message>
            </ns0:result>
            <ns2:passwordEncrypted>{ data($encryptAccountPassword1/RESULT) }</ns2:passwordEncrypted>
        </ns2:encryptPasswordResponse>
};

declare variable $encryptAccountPassword1 as element() external;

xf:CBO2EncryptPasswordResponse($encryptAccountPassword1)