class Doctor
    attr_accessor :name

    @@all = []
    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def appointments
        Appointment.all.select do |appointment|
            appointment.doctor == self
        end
    end

    def new_appointment(date, patient)
        Appointment.new(date, patient, self)
    end

    def patients
        all_patients = []
        Appointment.all.select do |appointment|
            if appointment.doctor == self
                all_patients << appointment.patient
            end
        end
        all_patients.uniq
    end
end
