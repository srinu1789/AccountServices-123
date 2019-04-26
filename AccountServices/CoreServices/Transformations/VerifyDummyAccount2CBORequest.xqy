xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$verifyDummyAccountRequest1" element="ns4:verifyDummyAccountRequest" location="../xsd/AccountCoreServices.xsd" ::)
(:: pragma bea:local-element-complex-return type="VerifyDummyAccountRequestType/INPUT" location="../../../TFCommon/Services/CoreCBOServices/xsd/CoreCBOServices.xsd" ::)

declare namespace ns2 = "http://www.tracfone.com/AccountCommonTypes";
declare namespace ns1 = "http://www.tracfone.com/CommonTypes";
declare namespace ns4 = "http://www.tracfone.com/AccountCoreServices";
declare namespace ns3 = "http://www.tracfone.com/SecurityCommonTypes";
declare namespace ns0 = "http://www.tracfone.com/PhoneCommonTypes";
declare namespace xf = "http://tempuri.org/AccountServices/CoreServices/Transformations/VerifyDummyAccount2CBORequest/";

declare function xf:VerifyDummyAccount2CBORequest($verifyDummyAccountRequest1 as element(ns4:verifyDummyAccountRequest))
    as element() {
        <INPUT TASK = "verifyAccountDummyData">
            <ESN>{ data($verifyDummyAccountRequest1/ns4:esn) }</ESN>
           
            <BRAND_NAME>{ data($verifyDummyAccountRequest1/ns1:brandName) }</BRAND_NAME>
          
        </INPUT>
};

declare variable $verifyDummyAccountRequest1 as element(ns4:verifyDummyAccountRequest) external;

xf:VerifyDummyAccount2CBORequest($verifyDummyAccountRequest1)