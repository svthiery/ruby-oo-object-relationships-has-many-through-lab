class Patient
    attr_accessor :name
    @@all = []
    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def new_appointment(date, doctor)
        Appointment.new(date, self, doctor)
    end

    def appointments
        Appointment.all.select do |appointment|
            if appointment.patient == self
                appointment.date
            end
        end
    end

    def doctors
        all_doctors = []
        Appointment.all.select do |appointment|
            if appointment.patient == self
                all_doctors << appointment.doctor
            end
        end
        all_doctors.uniq
    end
end
