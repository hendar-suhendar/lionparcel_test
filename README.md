# Mobile Automation Test - Check Shipping Rates (Lion Parcel)

## Implementation
**Test Case Name:**  
Check Shipping Rate with Valid Input  
**Test Scenario:**  
Positive Test Case – Valid input on the "Check Shipping Rate" feature  
**Precondition:**  
User is already on the “Check Shipping Rate” page in the Lion Parcel mobile app  
**Priority:**  
High  
**Test Type:**  
Functional / Positive  
**Test Steps:**
1. Enter valid Origin City 
2. Enter valid Destination City  
3. Enter valid Package Weight
4. Enter valid Length Dimension
5. Enter valid Width Dimension
6. Enter valid Height Dimension
7. Enter Item Type 
8. Enter Item Insurance Value
9. Tap the **Check Rate** button
    
**Expected Result:**  
The system displays the correct shipping rate according to the entered data.  

---

**Tools Used:**  
- Robot Framework  
- Appium v3.x  
- Python  
- Gherkin Style  

**Run Command:**  
```bash
robot -d results tests/cek_tarif.robot
