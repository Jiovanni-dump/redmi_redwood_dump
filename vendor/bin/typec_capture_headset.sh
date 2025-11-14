# sample usage: playback_capture_headset.sh
VOCALTRACT=$1

echo "enabling headset mic"
tinymix 'TX SMIC MUX2' 'SWR_MIC1'
tinymix 'TX_AIF1_CAP Mixer DEC2' 1
tinymix 'DEC0_BCS Switch' 1
tinymix 'BCS CH_SEL' 'SWR_MIC1'
tinymix 'MBHC ChMap' 'SWRM_TX2_CH3'
tinymix 'DMIC2 ChMap' 'SWRM_TX2_CH3'
tinymix 'ADC2_MIXER Switch' 1

tinymix 'MultiMedia1 Mixer TX_CDC_DMA_TX_3' 1
tinymix 'TX_CDC_DMA_TX_3 SampleRate' KHZ_48

# start recording
tinycap /data/data/test1_$VOCALTRACT.wav -r 48000 -b 16 -T 2 &

usleep 100000

echo "enabling headphone"
tinymix 'RX_MACRO RX0 MUX' 'AIF1_PB'
tinymix 'RX_MACRO RX1 MUX' 'AIF1_PB'
tinymix 'RX_CDC_DMA_RX_0 Channels' 'Two'
tinymix 'RX INT0_1 MIX1 INP0' 'RX0'
tinymix 'RX INT1_1 MIX1 INP0' 'RX1'
tinymix 'RX INT0 DEM MUX' 'CLSH_DSM_OUT'
tinymix 'RX INT1 DEM MUX' 'CLSH_DSM_OUT'
tinymix 'RX_HPH_PWR_MODE' 'LOHIFI'
tinymix 'RX HPH Mode' 'CLS_H_LOHIFI'
tinymix 'RX_COMP1 Switch' 0
tinymix 'RX_COMP2 Switch' 0
tinymix 'HPHL_COMP Switch' 0
tinymix 'HPHR_COMP Switch' 0
tinymix 'HPHL_RDAC Switch' 1
tinymix 'HPHR_RDAC Switch' 1
tinymix 'RX_RX0 Digital Volume' 84
tinymix "RX_RX1 Digital Volume" 84
tinymix 'HPHL Volume' 20
tinymix 'HPHR Volume' 20

tinymix 'RX_CDC_DMA_RX_0 Audio Mixer MultiMedia1' 1
tinyplay /vendor/etc/RES1K.wav

echo "disabling headphone"
tinymix 'RX_MACRO RX0 MUX' 'ZERO'
tinymix 'RX_MACRO RX1 MUX' 'ZERO'
tinymix 'RX_CDC_DMA_RX_0 Channels' 'One'
tinymix 'RX INT0_1 MIX1 INP0' 'ZERO'
tinymix 'RX INT1_1 MIX1 INP0' 'ZERO'
tinymix 'RX INT0 DEM MUX' 'NORMAL_DSM_OUT'
tinymix 'RX INT1 DEM MUX' 'NORMAL_DSM_OUT'
tinymix 'RX_COMP1 Switch' 0
tinymix 'RX_COMP2 Switch' 0
tinymix 'HPHL_COMP Switch' 0
tinymix 'HPHR_COMP Switch' 0
tinymix 'HPHL_RDAC Switch' 0
tinymix 'HPHR_RDAC Switch' 0

tinymix 'RX_CDC_DMA_RX_0 Audio Mixer MultiMedia1' 0

usleep 1900000

echo "disabling headset mic"
tinymix 'TX SMIC MUX2' 'ZERO'
tinymix 'TX_AIF1_CAP Mixer DEC2' 0
tinymix 'DEC0_BCS Switch' 0
tinymix 'BCS CH_SEL' 'SWR_MIC0'
tinymix 'MBHC ChMap' 'ZERO'
tinymix 'DMIC2 ChMap' 'ZERO'
tinymix 'ADC2_MIXER Switch' 0

tinymix 'MultiMedia1 Mixer TX_CDC_DMA_TX_3' 0
tinymix 'TX_CDC_DMA_TX_3 SampleRate' 'KHZ_48'