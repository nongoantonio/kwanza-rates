-- CreateEnum
CREATE TYPE "RateType" AS ENUM ('OFFICIAL', 'PARALLEL');

-- CreateTable
CREATE TABLE "exchange_rates" (
    "id" SERIAL NOT NULL,
    "type" "RateType" NOT NULL DEFAULT 'OFFICIAL',
    "base" TEXT NOT NULL,
    "target" TEXT NOT NULL,
    "mid" DECIMAL(18,4) NOT NULL,
    "buy" DECIMAL(18,4),
    "sell" DECIMAL(18,4),
    "rateDate" DATE NOT NULL,
    "source" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "exchange_rates_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "exchange_rates_base_target_rateDate_idx" ON "exchange_rates"("base", "target", "rateDate");

-- CreateIndex
CREATE UNIQUE INDEX "exchange_rates_type_base_target_rateDate_source_key" ON "exchange_rates"("type", "base", "target", "rateDate", "source");
