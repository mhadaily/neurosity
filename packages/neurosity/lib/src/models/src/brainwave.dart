///
enum BrainwavesLabel {
  ///
  raw,

  ///
  rawUnfiltered,

  ///
  powerByBand,

  ///
  psd,
}

///
typedef AmplitudeByChannel = List<List<int>>;

///
class EpochInfo {
  ///
  EpochInfo({
    required this.samplingRate,
    required this.startTime,
  });

  ///
  final int samplingRate;

  ///
  final int startTime;
}

///
class Epoch {
  ///
  Epoch({
    required this.data,
    required this.info,
  });

  ///
  final AmplitudeByChannel data;

  ///
  final EpochInfo info;
}

// export type PSDByChannel = number[][];

// export interface PSD {
//   psd: PSDByChannel;
//   freqs: number[];
//   info: {
//     samplingRate: number;
//     startTime: number;
//   };
// }

// export type BandName = "gamma" | "beta" | "alpha" | "theta" | "delta";

// export interface PowerByBand {
//   gamma: number[];
//   beta: number[];
//   alpha: number[];
//   theta: number[];
//   delta: number[];
// }
