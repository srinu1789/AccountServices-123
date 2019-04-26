xquery version "2004-draft";
<dvm name="userDefinedErrorCodes" xmlns="http://xmlns.oracle.com/dvm">
  <description>
    Transforming CBO Error Codes to OSB layer defined Error Codes
  </description>
  <columns>
    <column name="resultCodeCBO"/>
    <column name="resultCodeOSB"/>
    <column name="resultMessageOSB" qualifier="true"/>
  </columns>
  <rows>
    <row>
      <cell>101</cell>
      <cell>10100</cell>
      <cell>Device not found</cell>
    </row>
    <row>
      <cell>437</cell>
      <cell>10100</cell>
      <cell>Device not found</cell>
    </row>
    <row>
      <cell>6010</cell>
      <cell>10500</cell>
      <cell>Device could not be deleted</cell>
    </row>
    
    <row>
          <cell>-4</cell>
          <cell>10501</cell>
          <cell>Last/Active device of the group cannot be deleted</cell>
    </row>
    <row>
              <cell>4</cell>
              <cell>10501</cell>
              <cell>Last/Active device of the group cannot be deleted</cell>
    </row>
          <row>
          <cell>-100</cell>
          <cell>10500</cell>
          <cell>Device could not be deleted</cell>
    </row>
          <row>
          <cell>5</cell>
          <cell>11500</cell>
          <cell>Group has an active device and cannot be expired</cell>
    </row>
          <row>
          <cell>2</cell>
          <cell>11200</cell>
          <cell>Account group id cannot be blank</cell>
    </row>
	<row>
          <cell>3</cell>
          <cell>11300</cell>
          <cell>account group id was not found.</cell>
    </row>
  </rows>
  </dvm>