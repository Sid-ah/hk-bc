require_relative '../ride_height_checker'

describe RideHeightChecker do
  describe 'checking permission for for rider to ride a ride' do
    context 'when the ride provides its own minimum height' do
      let(:rider) { double('rider', { height: 30 }) }

      it 'permits the rider if the rider height is greater than the ride minimum height' do
        ride = double('ride', { minimum_height: 20 })
        expect(RideHeightChecker.rider_permitted?(rider, ride)).to be true
      end

      it 'permits the rider if the rider height is equal to the ride minimum height' do
        ride = double('ride', { minimum_height: rider.height })
        expect(RideHeightChecker.rider_permitted?(rider, ride)).to be true
      end

      it 'does not permit the rider if the rider height is less than the ride minimum height' do
        ride = double('ride', { minimum_height: 40 })
        expect(RideHeightChecker.rider_permitted?(rider, ride)).to be false
      end
    end

    context 'when the ride does not provide its own minimum height' do
      context 'for roller coasters' do
        let(:ride) { double('ride', { type: :coaster, minimum_height: nil }) }

        it 'permits riders at least 52 inches tall to ride' do
          rider = double('rider', { height: 52 })
          expect(RideHeightChecker.rider_permitted?(rider, ride)).to be true
        end

        it 'does not permit riders less than 52 inches tall to ride' do
          rider = double('rider', { height: 51 })
          expect(RideHeightChecker.rider_permitted?(rider, ride)).to be false
        end
      end

      context 'for thrill rides' do
        let(:ride) { double('ride', { type: :thrill, minimum_height: nil }) }

        it 'permits riders at least 48 inches tall to ride' do
          rider = double('rider', { height: 48 })
          expect(RideHeightChecker.rider_permitted?(rider, ride)).to be true
        end

        it 'does not permit riders less than 48 inches tall to ride' do
          rider = double('rider', { height: 47 })
          expect(RideHeightChecker.rider_permitted?(rider, ride)).to be false
        end
      end

      context 'for family rides' do
        let(:ride) { double('ride', { type: :family, minimum_height: nil }) }

        it 'permits riders at least 44 inches tall to ride' do
          rider = double('rider', { height: 44 })
          expect(RideHeightChecker.rider_permitted?(rider, ride)).to be true
        end

        it 'does not permit riders less than 44 inches tall to ride' do
          rider = double('rider', { height: 43 })
          expect(RideHeightChecker.rider_permitted?(rider, ride)).to be false
        end
      end

      context 'for other rides' do
        let(:ride) { double('ride', { type: :other, minimum_height: nil }) }

        it 'permits riders at least 36 inches tall to ride' do
          rider = double('rider', { height: 36 })
          expect(RideHeightChecker.rider_permitted?(rider, ride)).to be true
        end

        it 'does not permit riders less than 36 inches tall to ride' do
          rider = double('rider', { height: 35 })
          expect(RideHeightChecker.rider_permitted?(rider, ride)).to be false
        end
      end
    end
  end
end
