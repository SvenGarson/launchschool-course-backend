class InvalidCodonError < StandardError; end

class Translation
  STOP_ACID = 'STOP'.freeze

  CODON_ACID_MAP = {
    %w(AUG)             => 'Methionine',
    %w(UUU UUC)         => 'Phenylalanine',
    %w(UUA UUG)         => 'Leucine',
    %w(UCU UCC UCA UCG) => 'Serine',
    %w(UAU UAC)         => 'Tyrosine',
    %w(UGU UGC)         => 'Cysteine',
    %w(UGG)             => 'Tryptophan',
    %w(UAA UAG UGA)     => STOP_ACID
  }.freeze

  def self.of_rna(rna)
    codons = rna.scan(/[a-zA-Z]{3}/)

    aminoacids = Array.new

    codons.each do |codon|
      acid = find_acid(codon)

      break if acid == STOP_ACID

      aminoacids << acid
    end

    aminoacids
  end

  def self.of_codon(codon)
    find_acid(codon)
  end

  def self.find_acid(codon)
    acid_found = CODON_ACID_MAP.find { |codons, _| codons.include?(codon) }

    unless acid_found
      raise InvalidCodonError, "Codon '#{codon}' does not exist."
    end

    acid_found.last
  end

  def self.codon_exist?(codon)
    acid = find_acid(codon)
    acid ? true : false
  end

  private_class_method(:find_acid, :codon_exist?)
end
