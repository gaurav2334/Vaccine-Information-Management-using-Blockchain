//SPDX-License-Identifier: MIT 

pragma solidity ^0.8.0;

contract CovidVaccination {

    struct admin{
        uint a_addhar;
        string a_email;
        string a_aAddress;
    }
    mapping(uint=> admin) public a_data;
    admin[] a_d;

    //add admin through function
    function add_admin(
        uint a_aadhaar,
        string memory a_email,
        string memory a_aAddress
    ) public {
        CovidVaccination.admin memory a = admin(
            a_aadhaar,
            a_email,
            a_aAddress);
        a_d.push(a);
        a_data[a_aadhaar] = a;
    }

    // structure for vaccination center
    struct vaccinationCenter {
        uint vc_id;
        string vc_name;
        string vc_district;
        string vc_state;
    }

    mapping(uint => vaccinationCenter) public vc_data;
    vaccinationCenter[] centers;

    // Checking the vaccination center already exists or not
    function check_vcenter(uint _id) public view returns (uint) 
      {
        uint _find = 0;
        for (uint _i = 0; _i < centers.length; _i++)
           {
            if (centers[_i].vc_id == _id)
            {
                _find = 1;
            }
        }
        return (_find);
    }

    // function to add vaccination center
    function addVaccinationCenter(uint _id,  string memory _name, string memory _district, string memory _state) public {
        if(check_vcenter(_id) == 0) 
          {
            vaccinationCenter memory x = vaccinationCenter(_id, _name, _district, _state);
            centers.push(x);
            vc_data[_id] = x;
        }
    }


    // structure for doctor
    struct doctor {
        uint d_aadhaar;
        string d_name;
        uint d_phone ;
        string d_email;
        string d_experience;
        string d_hospital;
        string d_address;
    }
    mapping(uint=>doctor) public d_data;
    doctor[] doct;

     // Checking doctor already exists or not
    function check_doctor(uint _aadhaar) public view returns (uint)
       {
        uint _find = 0;
        for (uint _i = 0; _i < doct.length; _i++)
           {
            if (doct[_i].d_aadhaar == _aadhaar) 
            {
                _find = 1;
            }
        }
        return (_find);
    }

    // function to add a new doctor
    function addNewdoctor(uint _aadhaar,  string memory _name, uint _phone, string memory _email,string memory _experience,string memory _hospital,string memory _address) public {
        if(check_doctor(_aadhaar) == 0)
          {
            doctor memory x = doctor(_aadhaar, _name, _phone, _email,_experience,_hospital,_address);
            doct.push(x);
            d_data[_aadhaar] = x;
        }
    }

    
    // structure for person/patient
    struct person {
        uint p_aadhaar;
        string p_name;
        string p_dob;
        string p_address;
        uint p_phone;
        uint vc_id;
        string p_date;
        string p_time;
        string p_health;
    }

    mapping(uint => person) public p_data;
    person[] people;

    
    // Checking the person/patient is already exists or not/validity check
    function check_person(uint _aadhaar) public view returns (uint)
       {
        uint _find = 0;
        for (uint _i = 0; _i < people.length; _i++) {
            if (people[_i].p_aadhaar == _aadhaar) {
                _find = 1;
            }
        }
        return (_find);
    }

    // function to register person/patient to the portal
    function register(uint _aadhaarNo, string memory _name, string memory _dob, string memory _address, uint _contact, uint _centerID, string memory _appointmentDate, string memory _appointTime, string memory _healthStatus) public {
        if(check_person(_aadhaarNo) == 0)
        {
            person memory x = person(_aadhaarNo, _name, _dob, _address, _contact, _centerID, _appointmentDate, _appointTime, _healthStatus);
            people.push(x);
            p_data[_aadhaarNo] = x;
        }
    }

    // structure for vaccination
    struct vaccination {
        uint v_id;
        uint p_aadhaar;
        string v_doctor;
        uint vc_id;
        string v_date;
        string v_time;
        string v_dose;
    }

    mapping(uint => vaccination) public v_data;
    vaccination[] vaccines;

    // Checking the vaccination details
    function check_vaccination(uint _aadhaar) public view returns (uint)
       {
        uint _find = 0;
        for (uint _i = 0; _i < vaccines.length; _i++)
          {
            if (vaccines[_i].p_aadhaar == _aadhaar)
             {
                _find = 1;
            }
        }
        return (_find);
    }

    // function to add vaccination details after vaccination
    function addVaccination(uint _id, uint _pAadhaar, string memory _doctor, uint _vcID, string memory _vDate, string memory _vTime, string memory _vDose) public {
        if(check_vaccination(_pAadhaar) == 0) 
         {
            vaccination memory x = vaccination(_id, _pAadhaar, _doctor, _vcID, _vDate, _vTime, _vDose);
            vaccines.push(x);
            v_data[_id] = x;
        }
        
    }

    

  // function to show vaccination center by ID
    function showVaccinationCenterByID(uint _vcID) public view returns (uint, string memory, string memory, string memory) {
        return (
            vc_data[_vcID].vc_id, 
            vc_data[_vcID].vc_name, 
            vc_data[_vcID].vc_district, 
            vc_data[_vcID].vc_state
        );
    }
    
}
