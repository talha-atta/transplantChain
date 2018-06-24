pragma experimental ABIEncoderV2;

contract transplantChain {
    

    //Declaring the roles for the contract 
    struct Patient {
        string bloodType;
        string HLA;
        uint age;
        bool operationEligibility;
        uint position;
        bool isDonor;
        uint urgency;
        address patient;
    }
    
    mapping(address => Patient) public patients;
    mapping(address => uint) verifications;
    Patient[] public allPatients;
    function stringReturn() view public returns(Patient[]) {
        return allPatients;
    }
    
   modifier donorOnly() {
        require(msg.sender == donor);
        _;
    } 
    
    modifier doctorSignOffs() {
        require(msg.sender == doctors);
        _;
    }
    
    //Declaring Varibles
    address public doctors;
    address public donor;
    address public reciever; 
    
    function transplantChain(address _doctors) payable {
        doctors = _doctors;
        
    } 
    
    function setData(address _username, string _bloodType, string _HLA, uint _age, bool _operationEligibility, uint _position, bool _isDonor, address _patient, bool _doctorSignOff, uint _urgency) {
        var Patient = patients[_username];
        if(_doctorSignOff == true) {
        Patient.bloodType = _bloodType;
        Patient.HLA = _HLA;
        Patient.age = _age;
        Patient.operationEligibility = _operationEligibility;
        Patient.position = _position;
        Patient.isDonor = _isDonor;
        Patient.patient = _patient;
        Patient.urgency = _urgency;
        verifications[_username] += 1;
        allPatients.push(patients[_username]) -1;
        if(verifications[_username] >= 3) {
            throw;
        }
        
        if (Patient.isDonor == true) donor = msg.sender;
        if (Patient.isDonor == false) reciever = msg.sender;
        }
    }
    address username;
    function setUserName(address _username) {
        username = _username;
    }
    function getData() view public returns(uint){
        return(verifications[username]);
    }
}
