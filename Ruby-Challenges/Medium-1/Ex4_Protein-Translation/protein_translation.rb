class InvalidCodonError < StandardError
  def initialize(invalid_codon_string)
    super("There is no '#{invalid_codon_string}' codon.")
  end
end

class Translation
  STOP_ACID = 'STOP'
  CODON_LENGTH = 3

  CODON_ACID_MAP = {
    %w(AUG)             => 'Methionine',
    %w(UUU UUC)         => 'Phenylalanine',
    %w(UUA UUG)         => 'Leucine',
    %w(UCU UCC UCA UCG) => 'Serine',
    %w(UAU UAC)         => 'Tyrosine',
    %w(UGU UGC)         => 'Cysteine',
    %w(UGG)             => 'Tryptophan',
    %w(UAA UAG UGA)     => STOP_ACID
  }

  def self.of_codon(codon_string)
    acid = acid_for_codon(codon_string)
    if acid
      acid
    else
      raise InvalidCodonError, codon_string
    end
  end

  def self.of_rna(rna_string)
    codons = extract_codon_candidates(rna_string)

    rna_acids = Array.new

    codons.each do |codon|
      acid = of_codon(codon)

      break if acid == STOP_ACID
      rna_acids << acid
    end

    rna_acids
  end

  private

  def self.extract_codon_candidates(rna_string)
    rna_characters = rna_string.length
    total_codons = (rna_characters - (rna_characters % CODON_LENGTH)) / CODON_LENGTH

    codons = Array.new
    total_codons.times do |codon_index|
      codon_start_index = codon_index * CODON_LENGTH
      codons << rna_string[codon_start_index, CODON_LENGTH]
    end

    codons
  end

  def self.acid_for_codon(codon_string)
    acid_result = CODON_ACID_MAP.find do |codons, _|
      codons.include? codon_string 
    end
    acid_result.nil? ? nil : acid_result.last
  end
end