xquery version "2004-draft";
(:: pragma bea:local-element-complex-parameter parameter="$verifyAccountDummyData1" type="VerifyAccountDummyDataResponseType/verifyAccountDummyData" location="../../../TFCommon/Services/CoreCBOServices/xsd/CoreCBOServices.xsd" ::)
(:: pragma bea:global-element-return element="ns2:verifyDummyAccountResponse" location="../xsd/AccountCoreServices.xsd" ::)

declare namespace ns2 = "http://www.tracfone.com/AccountCoreServices";
declare namespace ns1 = "http://www.tracfone.com/RuntimeFault";
declare namespace ns0 = "http://www.tracfone.com/CommonTypes";
declare namespace xf = "http://tempuri.org/AccountServices/CoreServices/Transformations/CBO2VerifyDummyAccountResponse/";

declare function xf:CBO2VerifyDummyAccountResponse($verifyAccountDummyData1 as element())
    as element(ns2:verifyDummyAccountResponse) {
        <ns2:verifyDummyAccountResponse>
            <ns0:result>
                <ns0:code>{ data($verifyAccountDummyData1/ERROR_NUM) }</ns0:code>
                <ns0:message>{ data($verifyAccountDummyData1/ERROR_STRING) }</ns0:message>
            </ns0:result>
                    <ns2:accountWebUserId>{ data($verifyAccountDummyData1/WEBUSER_OBJID) }</ns2:accountWebUserId>
            <ns2:accountContactObjId>{ data($verifyAccountDummyData1/CONTACT_OBJID) }</ns2:accountContactObjId>
             <ns2:isDummy>{ data($verifyAccountDummyData1/HAS_DUMMY_DATA) }</ns2:isDummy>
              <ns2:hasPaymentSource>{ data($verifyAccountDummyData1/HAS_PAYMENT_SOURCE) }</ns2:hasPaymentSource>
              
        </ns2:verifyDummyAccountResponse>
};

declare variable $verifyAccountDummyData1 as element() external;

xf:CBO2VerifyDummyAccountResponse($verifyAccountDummyData1)