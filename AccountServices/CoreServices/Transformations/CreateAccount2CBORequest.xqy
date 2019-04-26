xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$createAccountRequest1" element="ns2:createAccountRequest" location="../xsd/AccountCoreServices.xsd" ::)
(:: pragma bea:local-element-complex-return type="AddUserRequestType/INPUT" location="../../../TFCommon/Services/CoreCBOServices/xsd/CoreCBOServices.xsd" ::)

declare namespace ns2 = "http://www.tracfone.com/AccountCoreServices";
declare namespace ns1 = "http://www.tracfone.com/AccountCommonTypes";
declare namespace ns0 = "http://www.tracfone.com/CommonTypes";
declare namespace xf = "http://tempuri.org/AccountServices/CoreServices/Transformations/CreateAccount2CBORequest/";

declare function xf:CreateAccount2CBORequest($createAccountRequest1 as element(ns2:createAccountRequest))
    as element() {
        <INPUT TASK = "addUser">
            <STATE>{ data($createAccountRequest1/ns2:address/ns0:state) }</STATE>
            <CALL_ID>YES</CALL_ID>
            <BRAND_NAME>{ data($createAccountRequest1/ns0:brandName) }</BRAND_NAME>
            <ADDRESS2>{ data($createAccountRequest1/ns2:address/ns0:streetAddress/ns0:line2) }</ADDRESS2>
            <SOURCE_SYSTEM>{ data($createAccountRequest1/ns0:sourceSystem) }</SOURCE_SYSTEM>
            <ZIP>{ data($createAccountRequest1/ns2:address/ns0:zipcode) }</ZIP>
            <ADDRESS1>{ data($createAccountRequest1/ns2:address/ns0:streetAddress/ns0:line1) }</ADDRESS1>
            <CONSENT>
                {
                    if (data($createAccountRequest1/ns2:canTracfoneContactYou) = xs:boolean("true")) then
                        (1)
                    else 
                        0
                }
</CONSENT>
            <FIRST_NAME>{ data($createAccountRequest1/ns2:customerName/ns0:firstName) }</FIRST_NAME>
            
            { if(data($createAccountRequest1/ns2:fourPin)) then
            <FOUR_PIN>{ data($createAccountRequest1/ns2:fourPin) }</FOUR_PIN>
            else
            ()
            }
            <EMAIL>{ data($createAccountRequest1/ns2:accountCredentials/ns1:email) }</EMAIL>
            <SEC_ANS>{ data($createAccountRequest1/ns2:securityQuestionAnswer) }</SEC_ANS>
            <PASSWORD>{ data($createAccountRequest1/ns2:accountCredentials/ns1:password) }</PASSWORD>
            <ENTER_BILLING>0</ENTER_BILLING>
            <HOME_PHONE>{ data($createAccountRequest1/ns2:phoneNumber) }</HOME_PHONE>
            <SEC_QSTN>{ fn:replace(data($createAccountRequest1/ns2:securityQuestion),"'","") }</SEC_QSTN>
            <COUNTRY>USA</COUNTRY>
            {if (data($createAccountRequest1/ns2:canTracfonePartnersContactYou) = xs:boolean("true")) then
            <MOBILE_AD_OPT>1</MOBILE_AD_OPT>
            else 
            <MOBILE_AD_OPT>0</MOBILE_AD_OPT>
            }
            
            <CHECK_BILLING>FALSE</CHECK_BILLING>
            <LAST_NAME>{ data($createAccountRequest1/ns2:customerName/ns0:lastName) }</LAST_NAME>
            <DATE_OF_BIRTH>
                {
                    if (fn:string-length(data($createAccountRequest1/ns2:dateOfBirth)) > 0) then
                        (fn:concat(fn:month-from-date($createAccountRequest1/ns2:dateOfBirth),"/",
                        fn:day-from-date($createAccountRequest1/ns2:dateOfBirth), "/",
                        fn:year-from-date($createAccountRequest1/ns2:dateOfBirth)))
                    else 
                        xs:string('')
                }
</DATE_OF_BIRTH>
            <CITY>{ data($createAccountRequest1/ns2:address/ns0:city) }</CITY>
            <ESN>{ data($createAccountRequest1/ns2:esn) }</ESN>
            <DISTINCT_CONTACT_FLAG>{data($createAccountRequest1/ns2:distinctContactFlag)}</DISTINCT_CONTACT_FLAG>
            <IGNORE_NOTIFICATION>{
                    if (upper-case(data($createAccountRequest1/ns0:requestToken/ns0:clientId)) = "B2B") then
                        xs:string('Y')
                    else 
                        xs:string('N')
                }
</IGNORE_NOTIFICATION>
          <CHECK_OFFER>
           {
                    if (data($createAccountRequest1/ns2:canTracfoneContactYou) = xs:boolean("true")) then
                        (1)
                    else 
                        0
            }
          </CHECK_OFFER>
          <CHECK_PROGRAM>
          {
                    if (data($createAccountRequest1/ns2:canTracfonePartnersContactYou) = xs:boolean("true")) then
                        (1)
                    else 
                        0
            }          
          </CHECK_PROGRAM>
        </INPUT>
};

declare variable $createAccountRequest1 as element(ns2:createAccountRequest) external;

xf:CreateAccount2CBORequest($createAccountRequest1)