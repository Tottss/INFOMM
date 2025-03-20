
public class Appointments {
    public int Appointment_ID;
    public String MRN;
    public String NPI;
    public String Purpose;
    public String Start_datetime;
    public String End_datetime;
    public Double Total_fees;
    public String Payment_status;

    public Appointments(){
        Appointment_ID = 0;
        MRN = "";
        NPI = "";
        Purpose = "";
        Start_datetime = "";
        End_datetime = "";
        Total_fees = 0.00;
        Payment_status = "";
    }
}
