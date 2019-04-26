xquery version "2004-draft";
(:: pragma bea:local-element-complex-parameter parameter="$encryptAndEncodeTextWithSecureHash1" type="EncryptCsrPasswordResponseType/encryptAndEncodeTextWithSecureHash" location="../../../TFCommon/Services/CoreCBOServices/xsd/CoreCBOServices.xsd" ::)
(:: pragma bea:global-element-return element="ns2:encryptCsrPasswordResponse" location="../xsd/AccountCoreServices.xsd" ::)

declare namespace ns2 = "http://www.tracfone.com/AccountCoreServices";
declare namespace ns1 = "http://www.tracfone.com/RuntimeFault";
declare namespace ns0 = "http://www.tracfone.com/CommonTypes";
declare namespace xf = "http://tempuri.org/AccountServices/CoreServices/Transformations/CBO2EncryptCsrPasswordResponse/";

declare function xf:CBO2EncryptCsrPasswordResponse($encryptAndEncodeTextWithSecureHash1 as element())
    as element(ns2:encryptCsrPasswordResponse) {
        <ns2:encryptCsrPasswordResponse>
            <ns0:result>
                <ns0:code>{ data($encryptAndEncodeTextWithSecureHash1/ERROR_NUM) }</ns0:code>
                <ns0:message>{ data($encryptAndEncodeTextWithSecureHash1/ERROR_STRING) }</ns0:message>
            </ns0:result>
            <ns0:serverTransactionId>{ data($encryptAndEncodeTextWithSecureHash1/SERVER) }</ns0:serverTransactionId>
            <ns2:encryptPassword>{ data($encryptAndEncodeTextWithSecureHash1/ENCODED_TEXT) }</ns2:encryptPassword>
        </ns2:encryptCsrPasswordResponse>
};

declare variable $encryptAndEncodeTextWithSecureHash1 as element() external;

xf:CBO2EncryptCsrPasswordResponse($encryptAndEncodeTextWithSecureHash1)